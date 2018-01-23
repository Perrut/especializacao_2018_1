class UsuariosController < ApplicationController
  before_action :usuario_nao_logado, except: [:index, :new, :create]

  # GET usuarios/novo
  def new
    @usuario = Usuario.new
  end

  # POST usuarios/novo
  def create
    @usuario = Usuario.new(usuario_params)
    if @usuario.save
      redirect_to index_usuarios_path
    else
      render "new"
    end
  end

  # GET usuarios/1
  def show
    # find eh utilizado para encontrar um registro do bd pelo seu id apenas
    @usuario = Usuario.find(params[:id])
  end

  # GET usuarios/editar/1
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # PATCH usuarios/editar/1
  def update
    @usuario = Usuario.find(params[:id])
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
    @usuario = Usuario.find(params[:id])
    if @usuario.destroy
      redirect_to index_usuarios_path
    else
      redirect_to show_usuario_path(id: @usuario.id)
    end
  end

  private

  # este metodo impede que parametros indesejados entrem no nosso bd
  # boa pratica de seguranca
  def usuario_params
    params.require(:usuario).permit(:nome, :sobrenome, :email, :data_nascimento,
      :telefone, :password, :password_confirmation)
  end
end
