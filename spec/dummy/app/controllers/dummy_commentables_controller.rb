class DummyCommentablesController < ::ApplicationController
  def show
    @dummy_commmentable = DummyCommentable.find(params[:id])
  end
end
