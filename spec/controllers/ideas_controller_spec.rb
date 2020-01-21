require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    describe '#new' do
        it 'should render the new template' do
            get(:new)
            expect(response).to(render_template(:new)) 
        end 
        it 'should set an instance variable with a idea' do
            get(:new)
            
            expect(assigns(:idea)).to(be_a_new(Idea))
        end    

    end

    describe '#create' do
        # `context` the functionally teh same as `describe`, 
        # but we generally use it to organize groups of 
        # branching code paths
        context 'with valid parameters' do
            def valid_request 
                post(:create, params: { ideas: FactoryBot.attributes_for(:ideas)})
            end

            it 'should create an idea in the db' do
                count_before = Idea.count
                valid_request
                count_after = Idea.count 
                expect(count_after).to eq(count_before + 1)
            end
            it 'should redirect to the show page of that post' do
                valid_request
                ideas = Idea.last
                expect(response).to(redirect_to(idea_path(ideas)))
            end

            # context 'with invalid parameters' do
            #     def invalid_request 
            #         post(:create, params: { idea: FactoryBot.attributes_for(:idea, title: nil)})
            #     end
            #     it 'should assign an invalid new article as an instance variable' do 
            #         invalid_request
            #         expect(assigns(:idea)).to be_a(NewsArticle)
            #         expect(assigns(:idea).valid?).to be(false)
            #     end
            #     it 'should render the new template' do 
            #         invalid_request
            #         expect(response).to(render_template(:new)) 
            #     end
            #     it 'should not create a job post in the db' do 
            #         count_before = NewsArticle.count
            #         invalid_request
            #         count_after = NewsArticle.count 
            #         expect(count_after).to eq(count_before)
            #     end
            # end
        end    
    end 
end
