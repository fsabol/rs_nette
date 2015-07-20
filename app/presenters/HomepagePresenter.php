<?php

namespace App\Presenters;

use Nette,
	App\Model,
	Nette\Application\UI\Form;


/**
 * Homepage presenter.
 */
class HomepagePresenter extends BasePresenter
{

	/** @var Nette\Database\Context */
	private $database;


	public function __construct(Nette\Database\Context $database)
	{
		$this->database = $database;
	}


	public function renderDefault()
	{
		$this->template->articles = $this->database->table('articles')
			->order('title')
			->limit(10);
	}
}
