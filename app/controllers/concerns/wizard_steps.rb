module WizardSteps
  extend ActiveSupport::Concern

  included do
    class_attribute :wizard_class
    helper_method :wizard, :current_step
  end

  def index
    skip_policy_scope
    redirect_to step_path(wizard_class.first_key)
  end

  def show
    authorize wizard
  end

  def update
    authorize wizard
    current_step.assign_attributes step_params

    if current_step.save!
      if wizard.complete?
        wizard.complete! do |result|
          on_complete(result)
        end
      else
        redirect_to(next_step_path)
      end
    end
  end

  def completed
    authorize wizard_class
  end

private

  def wizard
    @wizard ||= wizard_class.new(wizard_store, params[:id])
  end

  def current_step
    @current_step ||= wizard.find_current_step
  end

  def next_step_path
    if (next_key = wizard.next_key)
      step_path next_key
    elsif (invalid_step = wizard.first_invalid_step)
      step_path invalid_step
    end
  end

  def step_params
    return {} unless params.key?(step_param_key)

    params.require(step_param_key).permit current_step.attributes.keys
  end

  def step_param_key
    current_step.class.model_name.param_key
  end

  def on_complete(_result)
    redirect_to(action: :completed)
  end
end
