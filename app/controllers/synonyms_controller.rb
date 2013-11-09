# encoding: utf-8
class SynonymsController < ApplicationController
  
  #
  # Сообщения об ошибках в шаблонах для разных объектов
  # - edit - для @synonym
  # - new  - для @person
  #
  
  before_filter :find_person, :only => [:new, :create]
  before_filter :find_synonym_and_person, :only => [:edit, :update, :destroy]

  def new
  end
  
  
  #
  # Может, создать синоним, а потом синониму назнасть знаменитость
  # @synonym.person = @person
  # тогда и одинаковые обхекты для сообщения об ошибок будут
  # 
  def create
    @person.synonyms.build(params[:synonym])
    
    if @person.save
      flash[:success] = "Синоним успешно сохранен"
      redirect_to edit_person_path @person
    else
      render :new
    end
  end
  
  def destroy
    @synonym.destroy    

    flash[:success] = "Синоним успешно удален"
    redirect_to edit_person_path(@person)  
  end
  
  def edit
  end
  
  def update
    if @synonym.update_attributes(params[:synonym])
      flash[:success] = "Синоним успешно обновлен"
      redirect_to edit_person_path(@person)
    else
      render :edit
    end
  end
  
  private
    def find_person
      person_id = params[:person_id].to_i
      @person = Person.find(person_id)
    end
    
    def find_synonym_and_person
      id = params[:id].to_i
      @synonym = Synonym.find(id)
      @person = @synonym.person
    end
end