module ApplicationHelper
  def back_link(path = :back, text: "Back", **options)
    render GovukComponent::BackLink.new(
      text: text,
      href: path,
      **options,
    )
  end

  def link_to_change_answer(step)
    link_to(diary_step_path(step.key), { class: "govuk-link" }) do
      "Change"
    end
  end
end
