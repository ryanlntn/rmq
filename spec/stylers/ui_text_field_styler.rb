describe 'stylers/ui_text_field' do
  class SyleSheetForUIViewStylerTests < RubyMotionQuery::Stylesheet
    def ui_text_field_kitchen_sink(st)
      st.text = 'foo'
      st.text_alignment = :center
      st.placeholder = "placeholder"
      st.border_style = UITextBorderStyleRoundedRect
      st.autocapitalization_type = UITextAutocapitalizationTypeWords
      st.keyboard_type = UIKeyboardTypeDefault
      st.return_key_type = UIReturnKeyNext
      st.spell_checking_type = UITextSpellCheckingTypeYes
    end

    def ui_text_field_email(st)
      st.keyboard_type = :email_address
    end

    def ui_text_field_google(st)
      st.return_key_type = :google
    end

    def ui_text_field_no_spell_check(st)
      st.spell_checking_type = :no
    end

    def ui_text_field_line_border(st)
      st.border_style = :line
    end
  end

  before do
    @vc = UIViewController.alloc.init
    @vc.rmq.stylesheet = SyleSheetForUIViewStylerTests
    @view_klass = UITextField
  end

  behaves_like "styler"

  it 'should apply a style with every UITextFieldStyler wrapper method' do
    view = @vc.rmq.append(@view_klass, :ui_text_field_kitchen_sink).get

    view.tap do |v|
      v.text.should == 'foo'
      v.textAlignment.should  == NSTextAlignmentCenter
      v.placeholder.should == "placeholder"
      v.borderStyle.should == UITextBorderStyleRoundedRect
      v.autocapitalizationType.should == UITextAutocapitalizationTypeWords
      v.keyboardType.should == UIKeyboardTypeDefault
      v.returnKeyType.should == UIReturnKeyNext
      v.spellCheckingType.should == UITextSpellCheckingTypeYes
    end
  end

  it 'should allow setting a keyboard type via symbol' do
    view = @vc.rmq.append(@view_klass, :ui_text_field_email).get
    view.keyboardType.should == UIKeyboardTypeEmailAddress
  end

  it 'should allow setting a return key via symbol' do
    view = @vc.rmq.append(@view_klass, :ui_text_field_google).get
    view.returnKeyType.should == UIReturnKeyGoogle
  end

  it 'should allow setting a spell checking type via symbol' do
    view = @vc.rmq.append(@view_klass, :ui_text_field_no_spell_check).get
    view.spellCheckingType.should == UITextSpellCheckingTypeNo
  end

  it 'should allow setting a border style via symbol' do
    view = @vc.rmq.append(@view_klass, :ui_text_field_line_border).get
    view.borderStyle.should == UITextBorderStyleLine
  end
end
