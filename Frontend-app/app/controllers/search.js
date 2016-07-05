import Ember from 'ember';

export default Ember.Controller.extend({
  actions: {
    search: function(){
      var url = "http://localhost:3000/api/v1/search_term/" + this.get('search_box');
      var that = this;
      $.ajax(url).then(function(result){
        var sorted_result = result.files.sort(function(a,b){
          return parseInt(a.word_count) < parseInt(b.word_count);
        });

        that.set('model', sorted_result);
      });
    }
  }
});
