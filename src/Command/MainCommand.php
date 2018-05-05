<?php

namespace PHPDocker\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;

class MainCommand extends Command
{
    private $input;
    private $output;

    protected function configure(): void
    {
        $this
            ->setName('application:run')
            ->setDescription('Application entry point')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): void
    {
        $this->input = $input;
        $this->output = $output;

        $output->writeln('Begin');
        // Put your stuff here
        $output->writeln('End');
    }
}
