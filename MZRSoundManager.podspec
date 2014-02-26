Pod::Spec.new do |s|
  s.name         = "MZRSoundManager"
  s.version      = "0.0.1"
  s.summary      = "SoundManager"
  s.description  = <<-DESC
                   This is a simple sound manager.
                   DESC
  s.homepage     = "http://github.com/morizotter/MZRSoundManager"
  s.license      = 'MIT'
  s.author       = { "Naoki Morita" => "author" }
  s.platform     = :ios, '7.0'
  s.source       = { :git => "git@github.com:morizotter/MZRSoundManager.git", :tag => "0.0.1" }
#  s.source       = { :git => ".git", :tag => "0.0.1" }
  s.requires_arc = true

  s.subspec 'MZRSoundManager' do |soundplayer|
    soundplayer.source_files = 'Classes/MZRSoundManager.{h,m}'
  end

  s.subspec 'OctaveSounds' do |octavesounds|
    octavesounds.source_files = 'Classes/MZRSoundManager+OctaveSounds.{h,m}'
    octavesounds.resource = 'Resources/Octave-Sounds/**/*.{aif}'
  end

end
