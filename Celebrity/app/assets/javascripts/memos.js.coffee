$ ->
  $('#feedback-btn')
    # .on 'click', '.edit, .cancel', (event) ->
    .on 'click', (event) ->
      # 表示を切り替え
    #   toggleEditor $(this).closest('.memo')
      toggleEditor $(this).closest('#feedback-btn')
 
    .on 'ajax:complete', '.edit_memo', (event, ajax, status) ->
      # 発火を確認
      alert status