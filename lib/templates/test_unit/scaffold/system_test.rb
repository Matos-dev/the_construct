require "application_system_test_case"

<% module_namespacing do -%>
class <%= class_name.pluralize %>Test < ApplicationSystemTestCase
  setup do
    @<%= singular_table_name %> = <%= fixture_name %>(:one)
  end

  test "visiting the index" do
    visit <%= plural_table_name %>_url
    assert_selector "h1", text: "<%= class_name.pluralize.titleize %>"
  end

  test "creating a <%= human_name %>" do
    visit <%= plural_table_name %>_url
    click_on "New <%= class_name.titleize %>"

    <%- attributes_hash.each do |attr, value| -%>
    <%- if boolean?(attr) -%>
    check_label "<%= singular_table_name  %>_<%= attr %>" if <%= value %>
    <%- else -%>
    fill_in "<%= attr.humanize %>", with: <%= value %>
    <%- end -%>
    <%- end -%>
    click_on "Create <%= human_name %>"

    assert_text "<%= human_name %> was successfully created."
    click_on "Back"
  end

  test "updating a <%= human_name %>" do
    visit <%= plural_table_name %>_url
    click_on "Edit it", match: :first

    <%- attributes_hash.each do |attr, value| -%>
    <%- if boolean?(attr) -%>
    check_label "<%= singular_table_name %>_<%= attr %>" if <%= value %>
    <%- else -%>
    fill_in "<%= attr.humanize %>", with: <%= value %>
    <%- end -%>
    <%- end -%>
    click_on "Update <%= human_name %>"

    assert_text "<%= human_name %> was successfully updated."
    click_on "Back"
  end

  test "destroying a <%= human_name %>" do
    visit <%= plural_table_name %>_url
    page.accept_confirm do
      click_on "Destroy it", match: :first
    end

    assert_text "<%= human_name %> was successfully destroyed."
  end
end
<% end -%>
