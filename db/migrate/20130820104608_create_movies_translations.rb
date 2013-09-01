class CreateMoviesTranslations < ActiveRecord::Migration
  def up
  #have to create a database table to store translations
  #and create another table within this based on the model that you'd like to translate
  #in this case the movies model
   Movie.create_translation_table!({ 
     title: :string,
     rating: :string,
     description: :text,
     release_date: :string
     
   }, {
     migrate_data: true
   })
  end

  def down
   Movie.drop_translation_table! migrate_data: true 
  end
end


