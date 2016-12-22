const fi='';
      fo='';
var f,g:text;
    a:array[1..100,1..100] of longint;
    d:array[1..4] of smallint=(0,0,1,-1);
    c:array[1..4] of smallint=(1,-1,0,0);
    kc:array[1..100,1..100] of longint;
    qx,qy:array[1..10010] of longint;
    front,back,r,cc,x,y:longint;
procedure Doc;
var i,j:longint;
    ch:char;
begin
        assign(f,fi);
        reset(f);
        readln(f,r,cc);
        for i:=1 to r do
        begin
                for j:=1 to cc do
                begin
                        read(f,ch);
                        case ch of
                        '.':a[i,j]:=0;
                        '*':a[i,j]:=1;
                        'B':a[i,j]:=2;
                        end;
                        if ch='C' then
                        begin
                                x:=i;
                                y:=j;
                        end;
                end;
                readln(f);
        end;
        close(f);
end;
procedure BFS(x,y:longint);
var i,u,v:longint;
begin
        fillchar(kc,sizeof(kc),0);
        for i:=1 to r*cc do
        begin
                qx[i]:=0;
                qy[i]:=0;
        end;
        front:=1;
        back:=1;
        qx[back]:=x;
        qy[back]:=y;
        a[x,y]:=1;
        kc[x,y]:=1;
        repeat
                u:=qx[front];
                v:=qy[front];
                inc(front);
                for i:=1 to 4 do
                begin
                        if ((u+d[i]) in [1..r]) and ((v+c[i]) in [1..cc]) then
                        begin
                                if a[u+d[i],v+c[i]]=2 then
                                begin
                                        assign(g,fo);
                                        rewrite(g);
                                        write(g,kc[u,v]);
                                        close(g);
                                        halt;
                                end;
                                if a[u+d[i],v+c[i]]=0 then
                                begin
                                        inc(back);
                                        qx[back]:=u+d[i];
                                        qy[back]:=v+c[i];
                                        kc[u+d[i],v+c[i]]:=kc[u,v]+1;
                                        a[u+d[i],v+c[i]]:=1;
                                end;
                        end;
                end;
        until front>back;
end;
begin
        Doc;
        BFS(x,y);
end.