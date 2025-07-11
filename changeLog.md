# Change log #

## 0.12.0

- introduce optional CSS style `+Expensive` for expensive things like
  evaluating XPath expressions, pointers etc. Reason: For long texts,
  it turned out, that there are some CSS features, that slow down
  oXygen. In order to make them optional, this CSS style was added.

## 0.11.1

- make **+diplomatic** style less error prone and more extensible
- improved CSS for taxonomies in the encoding description

## 0.11.0

- split toolbars like in oXbytei 0.21.0

## 0.10.0

- new actions
  - for `<abbr>` and `<expan>`
  - for `<orig>` and `<reg>`
- use wrap and un-wrap actions to make and handle those pairs

## 0.9.0

- Added optional CSS style `+Diplomatic` used for switching the
  display of `<lb>` and `<pb>` elements
- Removed showing/hiding `<note>` elements from the collapsed and
  expanded styles, because we have that in **+Comments**.

## 0.8.1-5

- update deployment on github

## 0.8.0

- Added optional CSS style `+Comments` for hiding/displaying comments.

## 0.7.0

- added sel.tag action to the CSS for the `<span>` element and remove
  other displaying of the analytical tag in the `@ana` attribute

## 0.6.3 ##

- added personal.css to be overriden for personal styles

## 0.6.2 ##

- fix `unwrap.choice` for unwrapping `choice/seg[@source]` from
  multiple recensions editing

## 0.6.1 ##

- extended `unwrap.choice` for unwrapping `choice/seg[@source]` from
  multiple recensions editing
- enabled overriding CSS for all styles
- make `@wit` editable through `+ Edit` CSS style

## 0.6.0 ##

- new author action for reporting changes
- show nested structures of `<taxonomy>` and `<interpGrp>` by CSS
- show `xml:id` of taxonomies and categories
- CSS additions to 0.5.4

## 0.5.4 ##

- CSS: do not set `visiblity` for header, but `display`

## 0.5.3 ##

- CSS for collapsed: hide apparatus if empty `<lem>`

## 0.5.2 ##

- fix action for deleting an apparatus entry

## 0.5.1 ##

- fix link to templates directory

## 0.5.0 ##

- templates directory in `${pdu}/templates`, i.e. the directory
  `templates` in your project

## 0.4.0 ##

- new action for appending another reading
- new CSS style named *+Anchors*
- moved the navigation action from 0.2.0 to oXbytei
- order of toolbar and menu entries

## 0.3.0 ##

- new action for removing all but one variants, choose which one to keep

## 0.2.0 ##

- new action for highlighting text referenced by anchor-based markup
  - e.g. highlight the portion text that an external double end-doint
    attached apparatus entry points to
  - this greatly simplyfies navigation and orientation in anchor based markup
- switch the display mode of `<lem>` in CSS depending on the method
  of variant encoding
  - In the *Collapsed* CSS style `<lem>` is only displayed for
    *parallel segmentation* and *external* apparatus entries.

## 0.1.0 ##

- first release with CSS styles and some author actions
