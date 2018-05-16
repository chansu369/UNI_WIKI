-- Uni wiki Project : 대학교 학과위키

-- 사용자 정보 테이블
create table wiki_user (
	userid		varchar2(20) primary key,	--사용자 아이디
	password	varchar2(20) not null,		--비밀번호
	usertype	varchar2(20) not null,		--사용자 구분(일반,관리자)
	name		varchar2(30) not null,		--고객 이름
	email		varchar2(30),			--고객 이메일
	subjectnum	number	not null,	 	--전공번호
	constraint wiki_user_fk foreign key(subjectnum) 
		references wiki_subject(subjectnum) on delete cascade
);


-- 전공
create table wiki_subject(
	subjectnum		number	primary key,		--전공번호
	subjectname		varchar2(50)	not null		--전공이름
);

-- 전공에 사용할 시퀀스 
create sequence wiki_subject_seq start with 1 increment by 1;


-- 위키 글
create table wiki_board(
	boardnum		number	primary key,		--글번호
	subjectnum		number	not null,		--전공
	content			varchar2(4000) not null,	--글내용
	filenum			number,				--첨부파일위치
	linknum			number,				--첨부링크위치
	inputdate		date	default sysdate,	--작성날짜,시간
	constraint wiki_board foreign key(subjectnum) 
		references wiki_subject(subjectnum) on delete cascade,
	constraint wiki_board_f foreign key(filenum) 
		references wiki_file(filenum) on delete cascade,
	constraint wiki_board_l foreign key(linknum) 
		references wiki_link(linknum) on delete cascade
);

-- 위키 글 사용할 시퀀스 
create sequence wiki_board_seq start with 1 increment by 1;


-- 위키 글 수정 대기 테이블
create table wiki_wait (
	updatenum		number	primary key,		--리플번호
	boardnum		number not null,		--본문 글번호
	content			varchar2(4000) not null,	--작성자 ID
	filenum			number,				--첨부파일위치
	linknum			number,				--첨부링크위치
	constraint update_wait foreign key(boardnum) 
		references wiki_board(boardnum) on delete cascade,
	constraint update_wait_f foreign key(filenum) 
		references wiki_file(filenum) on delete cascade,
	constraint update_wait_l foreign key(linknum) 
		references wiki_link(linknum) on delete cascade
);

-- 위키 글 수정 대기에 사용할 시퀀스 
create sequence wiki_wait_seq start with 1 increment by 1;


-- 파일
create table wiki_file(
	filenum			number	primary key,		--첨부파일
	originalfile		varchar2(200),			--첨부파일명 (원래 이름)
	savedfile		varchar2(100)			--첨부파일명 (실제 저장된 이름)
);

-- 파일에 사용할 시퀀스 
create sequence wiki_file_seq start with 1 increment by 1;


-- 링크
create table wiki_link(
	linknum			number	primary key,		--링크
	linkaddress		varchar2(3000)			--실제링크주소
);


-- 링크에 사용할 시퀀스 
create sequence wiki_link_seq start with 1 increment by 1;



-- 토론장 테이블
create table wiki_debate(
	debatenum	number	primary key,			--글번호
	subjectnum	number	not null,			--전공번호
	id					varchar2(20) not null,		--작성자 ID
	title				varchar2(100) not null,		--글제목
	content			varchar2(2000) not null,	--글내용
	inputdate		date default sysdate,		--작성날짜,시간
	hits			number		default 0,				--조회수
	constraint wiki_debate_fk foreign key(subjectnum) 
		references wiki_subject(subjectnum) on delete cascade
);

-- 토론장 일련번호에 사용할 시퀀스 
create sequence wiki_debate_seq start with 1 increment by 1;


-- 리플 내용
create table wiki_reply (
	replynum		number	primary key,		--리플번호
	debatenum		number not null,			--본문 글번호
	id				varchar2(20) not null,		--작성자 ID
	text			varchar2(200) not null,		--리플내용
	inputdate		date 	default sysdate,	--작성날짜
	constraint wiki_reply_fk foreign key(debatenum) 
		references wiki_debate(debatenum) on delete cascade
);

-- 리플에 사용할 시퀀스
create sequence wiki_reply_seq start with 1 increment by 1;


-- 테스트 데이터


-- 테스트용 관리자 데이터
insert into wiki_user values ('chansu369','9036918', 'admin', '최찬수', 'chansu369@naver.com', 2);


-- 테스트용 사용자 데이터 
insert into wiki_user values ('aaa','aaa', 'user', '홍길동', 'aaa@aaa.com', 1);

-- 테스트용 전공 데이터 
insert into wiki_subject values(wiki_subject_seq.nextval,'컴퓨터공학과');
insert into wiki_subject values(wiki_subject_seq.nextval,'일본어학과');

-- 테스트용 게시판 데이터

insert into wiki_board values(wiki_board_seq.nextval,1,
'기초 분야: 전자기학, 회로, 이산수학, 자료 구조, 오토마타, 알고리즘 등 컴퓨터 기술을 발달시키기 위한 기반이 되는 논리를 다루는 부분. 프로그래밍 분야: 컴퓨터 기술의 핵심을 이루는 분야로 C, C++, Java 등 여러 가지 프로그래밍 언어로 컴퓨터에게 명령하여 작동시키는 기술을 연구. 분야: CPU를 비롯한 등의 컴퓨터의 하드웨어 구조와 컴퓨터 시스템을 구성하는 운영 체제, 네트워크 등을 취급.
|입학생 중 컴퓨터공학과만 바라보고 입학한 학생이 꼭 한두 명씩은 존재한다. 이들은 학교 내에서 능력자, 괴수 등으로 불리며 프로그래밍 못하는 양민들의 선망의 대상. 보통 초등학교 입학 이전부터 컴퓨터에 관심을 갖고 자기 스스로 공부하여 대학교에서 꽃을 피운다. 그러나 그 능력자가 우유부단한 성격이라면 곧 과제 셔틀이 될 수 있으니 주의. 보통 컴공과에서 기초적으로 배우는 C언어나 파이썬 등은 이미 다 알고 있거나 바로바로 금방 익히기 때문에 이들에겐 누워서 떡 먹기. 이쪽에 취미가 있는 학생이라면 굉장히 수월하게 커리큘럼을 이수할 수 있지만, 그것도 1, 2학년 과정까지의 이야기이다.
 상위 과정으로 올라갈수록 직접 키보드를 두드리면서 코딩하는 과목은 적어지기 때문. 그나마 있는 과목도 설계 과목이나 네트워크 과목 등 코딩 실력 자체로 평가하는 과목이 아닌 경우가 대다수이고, 아예 컴파일러 작성 등 과제가 독학으로 커버할 수 없는 영역에까지 이르게 되면 누구나 평등하게 머리를 쥐어짜게 된다.. (하지만 컴파일러 등의 과제도 종종 1인용 과제로 나오기도 한다. 어차피 기계어부터 짜는 거 아니니까 생각보다는 복잡하지 않다...)
따라서 프로그래밍에 재능이 있는 학생이라도 대학 생활 내내 좋은 성적을 유지하려면 상당한 노력이 필요하다. 물론 이건 학교 커리큘럼에 한정된 이야기일 뿐이고, 기업에서 실시하는 각종 공모전은 닥치고 결과물이기 때문에 재능있는 학생들은 이런 부분에서 스펙을 쌓는 것이 수월하다.프로그래머항목을 보면 알겠지만, 좋은 코더가 좋은 컴퓨터공학자가 되는 것은 아니다.
|기업계 : 공기업, 금융기관 등 자체적인 컴퓨터 시스템 관리를 필요로 하는 기업이나 소프트웨어 개발이 필요한 업체 등 컴퓨터와 관련된 대부분의 직업을 가질 수 있다.
연구계 : 항공우주연구소, 국방과학연구소, 융합소프트웨어 연구소 등에서 일하거나 정보통신교육원, 정보통신정책연구원, 전자통신연구원
학계,교육계 : 정보통신 관련 전공 분야의 대학교수 및 교사, 대학원이나 ROTC 진학, IT 전문 강사
정부,공공기관,기타 : 정보통신을 기반으로 하는 교육행정직, 전산직, 경찰직 등의 공무원, 국책연구소, 한국콘텐츠진흥원, 국가정보원등
|컴퓨터공학과 관련문서',
1,1,sysdate);


insert into wiki_board values(wiki_board_seq.nextval,2,
'고급일본어문법 : 난해한 문장의 독해력을 기르기 위해 일본어 대우표현(경어), 사역문 등 복잡한 문형의 문법구조를 배웁니다.
고급일본어작문 : 일본어로 생각하는 바를 정확하고 효율적으로 표현할 수 있는 고도의 작문 능력을 기르기 위해 보다 고급스런 일본어 작문기업에 대해 배웁니다.
고급일본어회화 : 회화체의 중급 수준을 완료한 후 발전시킨 응용 회화체를 배웁니다.
일본현대소설입문 : 일본의 대표적 소설 작품들을 감상하고 각 작품에 나타난 작가의 문학적 성향을 분석·비평하여 일본 문학의 특징에 대해 배웁니다.
초급일본어 : 일본어의 문자, 발음의 기호를 익혀 기본적인 일본어 체계에 대해 배웁니다.
일본전통문화론 : 오늘날의 일본 문화의 근간을 이루고 있는 사상, 종교, 예술, 예능, 문학, 미의식, 민속 등 여러 형태의 전통문화에 대해서 몇 가지 테마를 설정하여 그 성립과 이념, 발전 양상을 심도있게 살펴봄으로써 일본에 대한 심층적이고 총체적인 이해를 배웁니다.
고급일본어회화 : 회화체의 중급 수준을 완료한 후 발전시킨 응용 회화체를 배웁니다.
일본어현대어문법 : 일본어를 바탕으로 문을 구성하고 있는 여러 성분들의 구성 법칙을 귀납시켜서 전통 문법으로 정리해 나감으로써 일본어의 현대어문법을 배웁니다.
일본어강독 : 일본어 현대문을 취급한 교재를 선택하여 연습형식에 의한 속독연습을 행한다. 중급 정도의 문형과 표현을 이해하여 암기하도록 하고 문장의 요지를 정확하게 파악하여 배웁니다.
|반일 성향이 있는 사람은 일어일문학 전공자를 친일파로 여기는 경우도. 본인이 오타쿠라서 들어오는 경우도 있지만, 생각 외로 일본에 별 관심 없는데 학과에 입학하는 경우가 많기 때문에 위의 말은 되도록 삼가는 것이 좋다. 오히려 타과 학생이 일어일문학과 어학관련 수업을 열정적으로 들을 경우에 오타쿠일 확률이 높다.
실제로 만나보거나 대화를 해보면 알겠지만 오히려 일어일문학과를 다니면서  애국심이 큰 사람도 많고 일본과 관련된 과인 만큼 위와 같은 오해를 잡기 위해 재대로 된 역사 의식을 갖고 있는 사람도 되려 많기도 하다.
그리고 일본어는 독학으로 해도 충분한데 왜 전공까지 하냐며 비아냥거리는 사람이 꼭 한 명씩 있다. 이는 어학과 언어학/문예학의 차이를 몰라서 하는 망언이며, 전공자에 대한 대단한 실례이다. 독학으로 공부해서 되는 수준은 기초 일본어까지이다. 보통 난이도가 갑자기 올라가기 시작하는 2학년 후반부 부터 힘들어하는 학생이 많이 있다. 그런 논리라면 국어국문학과나 영어영문학과 같은 학과도 필요없게 된다.애초에 일어일문학과가 정말 쓸데없다면 학부 4년에 석사, 박사 과정까지 존재할 이유가 없다.
|기업체 : 출판사, 무역 회사, 여행사, 호텔, 기업 일반 사무직 및 해외 영업직, 일본 현지 기업, 사설 학원
언론사 : 신문사, 잡지사, 방송국
연구소 : 국제 경제/무역 관련 국가·민간 연구소, 인문과학 관련 국가·민간 연구
정부 및 공공기관 : 중앙정부 및 지방자치단체, 일본대사관, 무역·수출입 관련
|일본어학과 관련문서',
1,1,sysdate);


-- 테스트용 파일 데이터
insert into wiki_file values(wiki_file_seq.nextval,'originaltestfile','savedtestfile');

-- 테스트용 링크 데이터
insert into wiki_link values(wiki_link_seq.nextval,'https://www.naver.com');
