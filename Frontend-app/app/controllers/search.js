import Ember from 'ember';

export default Ember.Controller.extend({
  search: function(){
    console.log(this.get('search_box'))
    var model = [{
      file_name: "lula gay",
      word_count: "3"
    },
    {
      file_name: "lula muito gay",
      word_count: "5"
    }
  ]
  this.set('model', model);
  }.observes("search_box")
});
