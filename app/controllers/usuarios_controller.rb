class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  before_action :usuario_nao_logado, except: [:new, :create, :buscacidades]
  before_action :usuario_logado, only: [:new, :create]
  before_action :usuario_correto, only: [:edit, :update]
  before_action :usuario_correto_ou_admin, only: :destroy

  # PATCH buscacidades
  def buscacidades
    estado = Estado.find_by(id: params[:estado])
    cidades = estado.cidades if estado

    @result = []
    if cidades
      cidades.each do |cidade|
        @result.append cidade
      end
    end

    respond_to do |format|
      format.json { render json: @result }
    end
  end

  # GET usuarios/novo
  def new
    @usuario = Usuario.new
  end

  # POST usuarios/novo
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      flash[:notice] = "Bem vindo à SocialzIN."
      log_in @usuario
    else
      flash.now[:notice] = "Algo errado aconteceu."
      render "new"
    end
  end

  # GET usuarios/1
  def show
    # find eh utilizado para encontrar um registro do bd pelo seu id apenas
  end

  # GET usuarios/editar/1
  def edit
  end

  # PATCH usuarios/editar/1
  def update
    if @usuario.update_attributes(usuario_params)
      redirect_to show_usuario_path(id: @usuario.id)
    else
      render "edit"
    end
  end

  # GET usuarios
  def index
    @usuarios = Usuario.all
  end

  # DELETE usuarios/1
  def destroy
    if @usuario.destroy
      redirect_to index_usuarios_path
    else
      redirect_to show_usuario_path(id: @usuario.id)
    end
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # este metodo impede que parametros indesejados entrem no nosso bd
  # boa pratica de seguranca
  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :data_nascimento,
      :telefone, :password, :password_confirmation, :avatar, :cidade_id)
  end

  def usuario_correto
    if current_user != @usuario
      flash[:alert] = "Não permitido."
      redirect_to show_usuario_path(id: current_user.id)
    end
  end

  def usuario_correto_ou_admin
    if !current_user.admin && current_user != @usuario
      flash[:alert] = "Não permitido."
      redirect_to show_usuario_path(id: current_user.id)
    elsif current_user == @usuario && current_user.admin
      flash[:alert] = "Não permitido."
      redirect_to show_usuario_path(id: current_user.id)
    end
  end
end
