const fi='';
      fo='';
var f,g:text;
    kq:array[1..30,0..32] of qword;
    m,n,t:longint;
function GetBit(k,x:longint):longint;
begin
        GetBit:=(x shr (k-1)) and 1;
end;
function KiemTra(j,k:longint):boolean;
var l,x,y,u,v:longint;
begin
        for l:=1 to m-1 do
        begin
                x:=GetBit(l,j);
                y:=GetBit(l+1,j);
                u:=GetBit(l,k);
                v:=GetBit(l+1,k);
                if (x+y+u+v=0) or (x+y+u+v=4) then exit(false);
        end;
        exit(true);
end;
procedure XuLi;
var i,j,t,k,l:longint;
    res:int64;
begin
        t:=1 shl m -1;
        fillchar(kq,sizeof(kq),0);
        for j:=0 to t do kq[1,j]:=1;
        for i:=2 to n do
        begin
                for j:=0 to t do
                begin
                        for k:=0 to t do
                        begin
                                if KiemTra(j,k) then
                                begin
                                        kq[i,j]:=kq[i,j]+kq[i-1,k];
                                end;
                        end;
                end;
        end;
        res:=0;
        for i:=0 to t do res:=res+kq[n,i];
        writeln(g,res);
end;
procedure Doc;
var i,j,k,temp:longint;
begin
        assign(f,fi);
        reset(f);
        readln(f,t);
        assign(g,fo);
        rewrite(g);
        for k:=1 to t do
        begin
                readln(f,m,n);
                if m>n then
                begin
                        temp:=m;
                        m:=n;
                        n:=temp;
                end;
                XuLi;
        end;
        close(f);
        close(g);
end;
begin
        Doc;
end.
