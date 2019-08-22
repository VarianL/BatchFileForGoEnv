@echo off

if not exist %GOPATH% (
    echo GOPATH dose not exist,please press any key to exit
    pause > nul
    exit
)

set srcPath=%GOPATH%\src
set orgPath=golang.org\x

if not exist %srcPath% (
    cd /d  %GOPATH%
    mkdir src\golang.org\x
    cd src\golang.org\x
) else (
    cd /d %srcPath%
    if exist golang.org (
        cd golang.org
        if exist x (
            cd x
            if exist tools (
                rd /q tools
            )
            if exist lint (
                rd /q lint
            )
        ) else (
            mkdir x
            cd x
        )
    ) else (
        mkdir %orgPath%
        cd %orgPath%
    )
)

git clone https://github.com/golang/tools.git
git clone https://github.com/golang/lint.git
cd %GOPATH%
go install golang.org/x/tools/cmd/goimports

cd src
git clone https://github.com/mdempsky/gocode.git github.com/mdempsky/gocode
git clone https://github.com/uudashr/gopkgs.git github.com/uudashr/gopkgs
git clone https://github.com/ramya-rao-a/go-outline.git github.com/ramya-rao-a/go-outline
git clone https://github.com/acroca/go-symbols.git github.com/acroca/go-symbols
git clone https://github.com/go-delve/delve.git github.com/go-delve/delve
git clone https://github.com/stamblerre/gocode.git github.com/stamblerre/gocode
git clone https://github.com/rogpeppe/godef.git github.com/rogpeppe/godef
git clone https://github.com/ianthehat/godef.git github.com/ianthehat/godef
git clone https://github.com/sqs/goreturns.git github.com/sqs/goreturns

cd ..


go install github.com/mdempsky/gocode
go install github.com/uudashr/gopkgs/cmd/gopkgs
go install github.com/ramya-rao-a/go-outline
go install github.com/acroca/go-symbols
go install golang.org/x/tools/cmd/guru
go install golang.org/x/tools/cmd/gorename
go install github.com/go-delve/delve/cmd/dlv
go install github.com/stamblerre/gocode
go install github.com/rogpeppe/godef
go install github.com/sqs/goreturns
go install golang.org/x/lint/golint

echo press any key to exit
pause > nul
exit
