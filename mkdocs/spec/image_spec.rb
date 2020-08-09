#!/usr/bin/env ruby
require 'dockerspec/serverspec'

describe 'Dockerfile' do
  describe docker_build('.') do

    it { should have_entrypoint ['mkdocs'] }
    it { should have_cmd        ['--help'] }
    it { should have_expose     '8000' }
    it { should have_user       'dev' }

    describe docker_run(described_image) do
      its(:stdout) { should eq '' }
    end

  end
end
