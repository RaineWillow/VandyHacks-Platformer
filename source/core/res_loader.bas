type ResLoader
    private:
        dim background as any pointer
        dim tileList(0 to 40) as any pointer
        
        dim playerSprites(0 to 10) as any pointer
        dim enemySprites(0 to 2) as any pointer

        dim gameWaves(0 to 4) as integer
        dim gameSounds(0 to 4) as integer
    public:
        declare sub loadTiles()
        declare sub loadBackground()
        
        declare sub loadPlayer()
        declare sub loadEnemy()

        declare sub loadSounds()
        
        declare sub init()
        declare function getTileImg(byval id as integer) as any pointer
        declare function getBackgroundImg() as any pointer
        declare function getPlayerFrame(byval id as integer) as any pointer
        declare function getEnemyFrame(byval id as integer) as any pointer

        declare function getWave(byval id as integer) as integer
        declare function getSound(byval id as integer) as integer
end type

sub ResLoader.loadTiles()
    'loads the images into memory
    for i as integer = 0 to 40
        this.tileList(i) = imagecreate(68, 68)
    next
    
    line this.tileList(0), (0, 0)-(41, 41), rgb(255, 0, 255)
    
    bload "res/tiles/cobblestone.bmp", this.tileList(1)
    bload "res/tiles/cobblestonegrass.bmp", this.tileList(2)
    
end sub

sub ResLoader.loadBackground()
    this.background = imagecreate(1600, 640)
    bload "res/backgrounds/new_back.bmp", this.background
end sub

sub ResLoader.loadPlayer()
    for i as integer = 0 to 10
        this.playerSprites(i) = imagecreate(68, 121)
    next
    
    bload "res/ent/sprite.bmp", this.playerSprites(0)
end sub

sub ResLoader.loadEnemy()
    for i as integer = 0 to 2
        this.enemySprites(i) = imagecreate(100, 67)
    next

    bload "res/ent/tiny_enemy.bmp", this.enemySprites(0)
    bload "res/ent/tiny_enemy2.bmp", this.enemySprites(1)
end sub

sub ResLoader.loadSounds()
    fbs_Load_WAVFile("res/sounds/Curser Move.wav", @this.gameWaves(0))
    fbs_Load_WAVFile("res/sounds/Jump.wav", @this.gameWaves(1))
    fbs_Load_WAVFile("res/sounds/Select.wav", @this.gameWaves(2))
    fbs_Load_WAVFile("res/sounds/Village Song.wav", @this.gameWaves(3))

    for i as integer = 0 to 3
        fbs_Create_Sound(this.gameWaves(i), @this.gameSounds(i))
    next
end sub

sub ResLoader.init()
    fbs_Init()
    this.loadTiles()
    this.loadBackground()
    this.loadPlayer()
    this.loadEnemy()
    this.loadSounds()
end sub

function ResLoader.getTileImg(byval id as integer) as any pointer
    return this.tileList(id)
end function

function ResLoader.getBackgroundImg() as any pointer
    return this.background
end function

function ResLoader.getPlayerFrame(byval id as integer) as any pointer
    return this.playerSprites(id)
end function

function ResLoader.getEnemyFrame(byval id as integer) as any pointer
    return this.enemySprites(id)
end function

function ResLoader.getWave(byval id as integer) as integer
    return this.gameWaves(id)
end function

function ResLoader.getSound(byval id as integer) as integer
    return this.gameSounds(id)
end function