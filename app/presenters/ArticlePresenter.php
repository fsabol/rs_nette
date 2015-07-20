<?php

namespace App\Presenters;

use Nette,
	Nette\Application\UI\Form;


class ArticlePresenter extends BasePresenter
{

	/** @var Nette\Database\Context */
	private $database;


	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	public function renderShow($articleId)
	{
		$article = $this->database->table('articles')->get($articleId);
		dump($container);die();
		if (!$article) {
			$this->error('Stránka nebyla nalezena');
		}

		$this->template->article = $article;
	}


	public function actionCreate()
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}
	}


	public function actionEdit($articleId)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}

		$article = $this->database->table('articles')->get($articleId);

		if (!$article) {
			$this->error('Článek nebyl nalezen');
		}
		$this['articleForm']->setDefaults($article->toArray());
	}


	public function actionDelete($articleId)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->redirect('Sign:in');
		}

		$article = $this->database->table('articles')->get($articleId)->delete();
		$this->flashMessage('Článek byl smazán.');

		$this->redirect('Homepage:');
	}


	protected function createComponentArticleForm()
	{
		$form = new Form;
		$form->addText('title', 'titulek:')
			->setRequired();
		$form->addText('anotace', 'anotace:')
			->setRequired();
		$form->addTextArea('content', 'obsah:')
			->setRequired();

		$form->addSubmit('send', 'Uložit a publikovat');
		$form->onSuccess[] = array($this, 'articleFormSucceeded');

		return $form;
	}


	public function articleFormSucceeded($form, $values)
	{
		if (!$this->getUser()->isLoggedIn()) {
			$this->error('Pro vytvoření, nebo editování článku se musíte přihlásit.');
		}
		$articleId = $this->getParameter('articleId');

		if ($articleId) {
			$article = $this->database->table('articles')->get($articleId);
			$article->update($values);
		} else {
			$article = $this->database->table('articles')->insert($values);
		}

		$this->flashMessage('Článek byl uložen.', 'success');
		$this->redirect('show', $article->id);
	}
}
