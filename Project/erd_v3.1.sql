
/* Drop Tables */

DROP TABLE report_fks CASCADE CONSTRAINTS;
DROP TABLE Admin_tbl CASCADE CONSTRAINTS;
DROP TABLE chat_fks CASCADE CONSTRAINTS;
DROP TABLE chat CASCADE CONSTRAINTS;
DROP TABLE Community CASCADE CONSTRAINTS;
DROP TABLE game_fks CASCADE CONSTRAINTS;
DROP TABLE game CASCADE CONSTRAINTS;
DROP TABLE game_record CASCADE CONSTRAINTS;
DROP TABLE Location CASCADE CONSTRAINTS;
DROP TABLE Matching_fks CASCADE CONSTRAINTS;
DROP TABLE Matching CASCADE CONSTRAINTS;
DROP TABLE Member_tbl CASCADE CONSTRAINTS;
DROP TABLE report CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE Admin_tbl
(
	admin_id varchar2(20) NOT NULL,
	admin_password varchar2(30) NOT NULL,
	PRIMARY KEY (admin_id)
);



CREATE TABLE chat
(
	chat_id varchar2(20) NOT NULL,
	sender_member_id varchar2(20),
	content varchar2(600),
	chat_time date,
	receiver_member_id varchar2(20),
	PRIMARY KEY (chat_id)
);

create sequence chat_sequence start with 1;
commit;

select sender_member_id,content, 
substr(to_char(chat_time,'yyyymmddhhmi'),1,4)||'년'||
substr(to_char(chat_time,'yyyymmddhhmi'),5,2)||'월'||
substr(to_char(chat_time,'yyyymmddhhmi'),7,2)||'일'||
substr(to_char(chat_time,'yyyymmddhhmi'),9,2)||'시'||
substr(to_char(chat_time,'yyyymmddhhmi'),11,2)||'분'
from chat where (sender_member_id='member001' and receiver_member_id='member002') or (sender_member_id='member002' and receiver_member_id='member001') order by chat_id;

select * from chat  order by chat_id;

 --select * from chat where sender_member_id='member001' or receiver_member_id='member001' order by chat_id desc;

--select to_char(chat_time,'yyyy-mm-dd-hh-mi-ss') time  from chat order by time;

delete from chat_fks;
delete from chat;
commit;


CREATE TABLE chat_fks
(
	member_id varchar2(20) NOT NULL,
	chat_id varchar2(20) NOT NULL
);



CREATE TABLE Community
(
	community_id varchar2(20) NOT NULL,
	title varchar2(60),
	content varchar2(1000),
	create_at date,
	updated_at date,
	writer_id varchar2(20),
	question_type varchar2(1),
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (community_id)
);


CREATE TABLE game
(
	game_id varchar2(20) NOT NULL,
	game_name varchar2(30) NOT NULL,
	game_description varchar2(300) NOT NULL,
	game_image varchar2(600) NOT NULL,
	PRIMARY KEY (game_id)
);





CREATE TABLE game_record
(
	game_record_id varchar2(20) NOT NULL,
	game_id varchar2(20) NOT NULL,
	score varchar2(4) NOT NULL,
	record_time date NOT NULL,
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (game_record_id)
);

CREATE TABLE game_fks
(
	game_id varchar2(20) NOT NULL,
	game_record_id varchar2(20) NOT NULL
);


CREATE TABLE Location
(
	location_id varchar2(20) NOT NULL,
	latitude number(10,6) NOT NULL,
	longitude number(10,6) NOT NULL,
	address varchar2(300),
	member_id varchar2(20) NOT NULL,
	PRIMARY KEY (location_id, member_id)
);


CREATE TABLE Matching
(
	matching_id varchar2(20) NOT NULL,
	sender_member_id varchar2(20) NOT NULL,
	receiver_member_id varchar2(20) NOT NULL,
	matching_status varchar2(1),
	sender_status varchar2(1),
	receiver_status varchar2(1),
	PRIMARY KEY (matching_id)
);


CREATE TABLE Matching_fks
(
	member_id varchar2(20) NOT NULL,
	matching_id varchar2(20) NOT NULL
);


CREATE TABLE Member_tbl
(
	member_id varchar2(20) NOT NULL,
	mname varchar2(15) NOT NULL,
	email varchar2(30) NOT NULL,
	mpassword varchar2(18) NOT NULL,
	age number(3,0),
	gender varchar2(1) NOT NULL,
	phone varchar2(11) NOT NULL,
	introduce varchar2(300),
	grade varchar2(30) NOT NULL,
	mbti varchar2(4),
	religion varchar2(20),
	job varchar2(30),
	image varchar2(600) NOT NULL,
	height varchar2(3),
	weight varchar2(3),
	love_type varchar2(2),
	like_cnt varchar2(5) NOT NULL,
	game_point varchar2(10) NOT NULL,
	PRIMARY KEY (member_id)
);


CREATE TABLE report
(
	report_id varchar2(20) NOT NULL,
	reported_member_id varchar2(20) NOT NULL,
	reporting_member_id varchar2(20) NOT NULL,
	report_content varchar2(300),
	-- 
	-- 
	report_date date,
	PRIMARY KEY (report_id)
);


CREATE TABLE report_fks
(
	report_id varchar2(20) NOT NULL,
	admin_id varchar2(20) NOT NULL
);



/* Create Foreign Keys */

ALTER TABLE report_fks
	ADD FOREIGN KEY (admin_id)
	REFERENCES Admin_tbl (admin_id)
;


ALTER TABLE chat_fks
	ADD FOREIGN KEY (chat_id)
	REFERENCES chat (chat_id)
;


ALTER TABLE game_fks
	ADD FOREIGN KEY (game_id)
	REFERENCES game (game_id)
;


ALTER TABLE game_fks
	ADD FOREIGN KEY (game_record_id)
	REFERENCES game_record (game_record_id)
;


ALTER TABLE Matching_fks
	ADD FOREIGN KEY (matching_id)
	REFERENCES Matching (matching_id)
;


ALTER TABLE chat_fks
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Community
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE game_record
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Location
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE Matching_fks
	ADD FOREIGN KEY (member_id)
	REFERENCES Member_tbl (member_id)
;


ALTER TABLE report_fks
	ADD FOREIGN KEY (report_id)
	REFERENCES report (report_id)
;



/* Comments */

COMMENT ON COLUMN report.report_date IS '
';














INSERT INTO Admin_tbl VALUES ('admin1', 'password1');
INSERT INTO Admin_tbl VALUES ('admin2', 'password2');
INSERT INTO Admin_tbl VALUES('admin3', 'password3');
INSERT INTO Admin_tbl VALUES('admin4', 'password4');
INSERT INTO Admin_tbl VALUES('admin5', 'password5');
INSERT INTO Admin_tbl VALUES('admin6', 'password6');
INSERT INTO Admin_tbl VALUES('admin7', 'password7');
INSERT INTO Admin_tbl VALUES('admin8', 'password8');
INSERT INTO Admin_tbl VALUES('admin9', 'password9');
INSERT INTO Admin_tbl VALUES('admin10', 'password10');
INSERT INTO Admin_tbl VALUES('admin11', 'password11');
INSERT INTO Admin_tbl VALUES('admin12', 'password12');
INSERT INTO Admin_tbl VALUES('admin13', 'password13');
INSERT INTO Admin_tbl VALUES('admin14', 'password14');
INSERT INTO Admin_tbl VALUES('admin15', 'password15');
INSERT INTO Admin_tbl VALUES('admin16', 'password16');
INSERT INTO Admin_tbl VALUES('admin17', 'password17');
INSERT INTO Admin_tbl VALUES('admin18', 'password18');
INSERT INTO Admin_tbl VALUES('admin19', 'password19');
INSERT INTO Admin_tbl VALUES('admin20', 'password20');


INSERT INTO Member_tbl VALUES ('member001', '강동원', 'abc321@naver.com', '1234abcd', 27, 'M', '01012345678', '안녕하세요. 저는 강동원입니다.', '일반회원', 'ISTJ', '무교', '직장인', '강동원1-1.jpg, 강동원2-2.png, 강동원3-3.png', '178', '72', 'a1', '100', '50000');
INSERT INTO Member_tbl VALUES ('member002', '박서준', 'ajf123@gmail.com', 'abcd1234', 33, 'M', '01023456789', '안녕하세요. 박서준입니다.', '일반회원', 'ISFJ', '천주교', '자영업', '박서준1-1.png, 박서준2-2.png, 박서준3-3.png', '182', '80', 'c1', '300', '25000');

INSERT INTO Member_tbl VALUES ('member003', 'RM', 'dsaf432@gmail.com', 'qwerty123', 25, 'M', '01034567890', '안녕하세요. RM입니다.', '일반회원', 'INFP', '기독교', '직장인', 'RM 1-1.png, RM 2-2.png, RM 3-3.png', '175', '70', 'b1', '357', '10000');

INSERT INTO Member_tbl VALUES ('member004', '박보검', 'adffg753@naver.com', 'abcd1234', 29, 'M', '01045678901', '안녕하세요. 박보검입니다.', 'VIP회원', 'ENTJ', '기독교', '직장인', '박보검1-1.png, 박보검2-2.png, 박보검 3-3.jpg', '178', '75', 'a1', '200', '100000');

INSERT INTO Member_tbl VALUES ('member005', '송중기', 'sfd837@gmail.com', 'qwer1234', 30, 'M', '01098765432', '안녕하세요. 저는 송중기입니다.', '일반회원', 'ENFP', '기독교', '대학생', '송중기1-1.jpg, 송중기2-2.jpg ,송중기3-3.jpg', '185', '80', 'd1', '120', '100000');

INSERT INTO Member_tbl VALUES ('member006', '정국', 'htyr52342@gmail.com', 'abcd1234', 25, 'M', '01055556666', '안녕하세요. 저는 정국입니다.', '일반회원', 'INFJ', '천주교', '직장인', '정국1-1.jpg, 정국2-2.jpg, 정국3-3.png', '180', '75', 'e1', '50', '20000');

INSERT INTO Member_tbl VALUES ('member007', '김수현', 'dfdfgds209@gmail.com', 'asdf5678', 33, 'M', '01011112222', '안녕하세요. 저는 김수현입니다.', '일반회원', 'INTP', '무교', '자영업', '김수현1-1.jpg, 김수현2-2.jpg, 김수현3-3.png', '187', '70', 'b1', '80', '30000');

INSERT INTO Member_tbl VALUES ('member008', '이정재', 'qwxcx17364@naver.com', 'qazxswed', 28, 'M', '01033334444', '안녕하세요. 저는 이정재입니다.', '일반회원', 'ISFJ', '천주교', '대학생', '이정재1-1.png, 이정재2-2.png, 이정재3-3.png', '181', '77', 'a1', '150', '50000');
INSERT INTO Member_tbl VALUES ('member009', '차은우', 'sgfgfg1456@gmail.com', 'abcd1234', 35, 'M', '01055556666', '안녕하세요. 저는 차은우입니다.', 'VIP', 'ENTP', '무교', '교수', '차은우1-1.jpg, 차은우2-2.jpg, 차은우3-3.jpg', '180', '78', 'a1', '500', '80000');

select * from Member_tbl;




INSERT INTO Community VALUES ('c001', '오늘의 영화 추천', '오늘은 영화를 소개해드리려 합니다. 제가 추천하는 영화는 위대한 쇼맨입니다. 이 영화는 음악과 춤을 사랑하는 모든 분들께 추천드리며, 특히 이 공연의 열정과 가슴 뛰는 여정을 느끼고 싶은 분들은 꼭 한 번 시청해보시길 추천드립니다!', '2023-05-12', '2023-05-12', 'writer123', 'M', 'member001');
INSERT INTO Community VALUES ('c002', '오늘의 새로운 맛집 소개', '오늘은 새로운 맛집을 소개해드리려 합니다. 이번에 소개할 맛집은 명동 칼국수입니다. 이곳의 추천 메뉴는 칼국수와 물만두인데요, 한국 전통음식을 제대로 먹어보고 싶은 분들은 꼭 방문해보시길 추천드립니다!','2023-05-11', '2023-05-11', 'writer456', 'M', 'member002');
INSERT INTO Community VALUES ('c003', '하루 일과 공유하기', '오늘은 하루 일과를 공유해보려 합니다. 오늘은 출근 후 회의를 진행하고, 업무를 처리하는 중간중간 산책을 나갔습니다. 오후에는 중요한 프로젝트 발표 자료를 마무리하고, 회사 동료들과 함께 저녁을 먹으며 이야기를 나눴습니다. 하루 종일 바쁘게 일하다 보니 피곤하지만, 뿌듯한 하루였습니다!','2023-05-10', '2023-05-10', 'writer789', 'Q', 'member003');
INSERT INTO Community  VALUES ('c004', '취미 추천해주세요', '요즘 새로운 취미를 찾고 있어요. 추천 좀 해주세요!', '2023-05-01', '2023-05-03', 'u001', 'H', 'member004');
INSERT INTO Community  VALUES ('c005', '산책 어디서 하세요?', '평소에 산책을 좋아해서 매일 산책을 다녀오는데, 다양한 장소를 알고 싶어요. 어디서 산책을 하시나요?', '2023-04-25', '2023-04-28', 'u003', 'H', 'member005');
INSERT INTO Community  VALUES ('c006', '여름에 가기 좋은 여행지 추천', '여름에 가기 좋은 여행지 추천해주세요!', '2023-04-15', '2023-04-16', 'u002', 'H', 'member006');
INSERT INTO Community  VALUES ('c007', '프로그래밍 초보입니다', '프로그래밍을 배워보려고 합니다. 어떤 언어를 배우는 것이 좋을까요?', '2023-05-10', '2023-05-10', 'u004', 'H', 'member007');
INSERT INTO Community  VALUES ('c008', '과외 비용 얼마가 적당한가요?', '저희 아이를 위해 수학 과외를 받으려고 하는데, 비용이 얼마가 적당한가요?', '2023-05-07', '2023-05-08', 'u005', 'H', 'member008');
INSERT INTO Community  VALUES ('c009', '집 꾸미기 팁', '집을 꾸미고 싶은데, 팁이 있으면 알려주세요!', '2023-04-20', '2023-04-20', 'u003', 'H', 'member009');






 
INSERT INTO game  VALUES('G00001', 'abc', 'dkjfdfsdfds', 'fassf');










INSERT INTO game_record VALUES ('GR00001', 'G00001', '100', '2023-05-10', 'member001'); 










INSERT INTO Location VALUES ('L00001', 37.5665, 126.9780, '서울특별시 강남구 역삼동', 'member001');
INSERT INTO Location VALUES ('L00002', 37.5665, 126.9780, '서울특별시 종로구 인사동', 'member002');
INSERT INTO Location VALUES ('L00003', 37.5665, 126.9780, '서울특별시 마포구 홍대입구', 'member003');
INSERT INTO Location VALUES ('L00004', 37.5665, 126.9780, '서울특별시 강서구 화곡동', 'member004');
INSERT INTO Location VALUES ('L00005', 37.5665, 126.9780, '서울특별시 송파구 잠실동', 'member005');
INSERT INTO Location VALUES ('L00006', 37.5665, 126.9780, '서울특별시 강동구 천호동', 'member006');
INSERT INTO Location VALUES ('L00007', 37.5665, 126.9780, '경기도 용인시 기흥구', 'member007');
INSERT INTO Location VALUES ('L00008', 37.5665, 126.9780, '서울특별시 강북구 미아동', 'member008');
INSERT INTO Location VALUES ('L00009', 37.5665, 126.9780, '서울특별시 중구 명동', 'member009');




INSERT INTO Matching VALUES ('MT00001', 'sender1', 'receiver1', 'Y', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT00002', 'sender2', 'receiver2', 'N', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00003', 'sender3', 'receiver3', 'Y', 'Y', 'N');
INSERT INTO Matching VALUES ('MT00004', 'sender4', 'receiver4', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT00005', 'sender5', 'receiver5', 'N', 'Y', 'N');
INSERT INTO Matching VALUES ('MT00006', 'sender6', 'receiver6', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00007', 'sender7', 'receiver7', 'N', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00008', 'sender8', 'receiver8', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT00009', 'sender9', 'receiver9', 'W', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000010', 'sender10', 'receiver10', 'W', 'N', 'N');
INSERT INTO Matching VALUES ('MT000011', 'sender11', 'receiver11', 'Y', 'N', 'N');
INSERT INTO Matching VALUES ('MT000012', 'sender12', 'receiver12', 'N', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000013', 'sender13', 'receiver13', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000014', 'sender14', 'receiver14', 'Y', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000015', 'sender15', 'receiver15', 'W', 'N', 'N');
INSERT INTO Matching VALUES ('MT000016', 'sender16', 'receiver16', 'W', 'Y', 'N');
INSERT INTO Matching VALUES ('MT000017', 'sender17', 'receiver17', 'Y', 'N', 'Y');
INSERT INTO Matching VALUES ('MT000018', 'sender18', 'receiver18', 'W', 'Y', 'Y');
INSERT INTO Matching VALUES ('MT000019', 'sender19', 'receiver19', 'W', 'N', 'Y');
INSERT INTO Matching VALUES ('MT000020', 'sender20', 'receiver20', 'N', 'N', 'N');











--INSERT INTO Member_tbl VALUES ('member010', '뷔', 'dfdar732@gmail.com', 'abcd1234', 28, 'M', '01066667777', '안녕하세요. 저는 뷔입니다.', '일반회원', 'ISFP', '기독교', '직장인', '뷔1-1.png, 뷔2-2.jpg, 뷔3-3.png', '179', '70', 'c1', '30', '10000');
--INSERT INTO Member_tbl VALUES ('member011', '김유정', 'asfdfsd162@gmail.com', 'abcd1234', 24, 'F', '01023456789', '안녕하세요. 김유정입니다.', '일반회원', 'ENFP', '기독교', '대학생', '김유정01, 김유정02, 김유정03', '160', '50', 'b2', '150', '20000');
--INSERT INTO Member_tbl VALUES ('member012', '미연', 'sfd6322@gmail.com', 'qwer5678', 31, 'F', '01034567890', '안녕하세요. 미연입니다.', '일반회원', 'INTJ', '무교', '직장인', '미연01, 미연02, 미연03', '171', '80', 'c2', '200', '30000');
--INSERT INTO Member_tbl VALUES ('member013', '박보영', 'sgdgf122@gmail.com', 'asdf4321', 22, 'F', '01045678901', '안녕하세요. 박보영입니다.', '일반회원', 'ISFP', '무교', '대학생', '박보영01, 박보영02, 박보영03', '163', '50', 'a2', '50', '5000');
--INSERT INTO Member_tbl VALUES ('member014', '사나', 'xvs533@gmail.com', 'zxcv0987', 29, 'F', '01056789012', '안녕하세요. 사나입니다.', 'VIP', 'ENFJ', '무교', '직장인', '사나01, 사나02, 사나02', '176', '70', 'e2', '120', '10000', 'R00005');
--INSERT INTO Member_tbl VALUES ('member015', '서지수', 'sghc525@gmail.com', 'qazx7531', 25, 'F', '01067890123', '안녕하세요. 서지수입니다.', '일반회원', 'INFJ', '기독교', '직장인', '서지수01, 서지수02, 서지수03', '169', '55', 'a2', '90', '8000', 'R00006');
--INSERT INTO Member_tbl VALUES ('member016', '아이유', 'ibfg523@gmail.com', 'wsed9658', 28, 'F', '01078901234', '안녕하세요. 아이유입니다.', 'VIP', 'ISTP', '기독교', '직장인', '아이유01, 아이유02, 아이유03', '162', '57', 'a2', '80', '6000', 'R00007');
--INSERT INTO Member_tbl VALUES ('member017', '채원', 'hdd623@gmail.com', 'rtyu1592', 30, 'F', '01090123456', '안녕하세요. 채원입니다.', '일반회원', 'INTP', '천주교', '직장인', '채원01, 채원02, 채원03', '169', '60', 'b2', '110', '9000', 'R00009');
--INSERT INTO Member_tbl VALUES ('member018', '카리나', 'hdd245@gmail.com', 'vbnm7531', 23, 'F', '01001234567', '안녕하세요. 카리나입니다.', '일반회원', 'ISFJ', '무교', '대학생', '카리나01, 카리나02, 카리나03', '170', '57', 'd2', '60', '3500', 'R00010');
--INSERT INTO Member_tbl VALUES ('member019', '태연', 'dhdg522@gmail.com', 'uiop4321', 27, 'F', '01034567890', '안녕하세요. 태연입니다.', 'VIP', 'INFJ', '불교', '직장인', '태연01, 태연02, 태연03', '165', '50', 'd2', '50', '5000', 'R00013');
--INSERT INTO Member_tbl VALUES ('member020', '혜리', 'mdjd652@gmail.com', 'zxcv9876', 22, 'F', '01045678901', '안녕하세요. 혜리입니다.', '일반회원', 'ISFP', '천주교', '대학생', '혜리01, 혜리02, 혜리03', '160', '50', 'a2', '120', '10000', 'R00014');





INSERT INTO report VALUES ('R00001', 'M00001', 'M00001', '인상이 좋은 회원입니다.', '2023-05-01');
INSERT INTO report VALUES ('R00002', 'M00002', 'M00003', '예의바르고 성격이 좋아 보이는 회원입니다.', '2023-05-02');
INSERT INTO report VALUES ('R00003', 'M00003', 'M00005', '착하실 것 같은 회원입니다.', '2023-05-03');
INSERT INTO report VALUES ('R00004', 'M00004', 'M00007', '멋지십니다.', '2023-05-04');
INSERT INTO report VALUES ('R00005', 'M00005', 'M00009', '동안이십니다.', '2023-05-05');
INSERT INTO report VALUES ('R00006', 'M00006', 'M00011', '예의바르고 친절한 회원입니다.', '2023-05-06');
INSERT INTO report VALUES ('R00007', 'M00007', 'M00013', '인상이 좋은 회원입니다.', '2023-05-07');
INSERT INTO report VALUES ('R00008', 'M00008', 'M00015', '친절하실 것 같아요.', '2023-05-08');
INSERT INTO report VALUES ('R00009', 'M00009', 'M00017', '자신감이 넘쳐 보이십니다.', '2023-05-09');
INSERT INTO report VALUES ('R00010', 'M00010', 'M00019', '멋지십니다.', '2023-05-10');
INSERT INTO report VALUES ('R00011', 'M00011', 'M00002', '좋은 인상을 받았습니다.', '2023/05/01');
INSERT INTO report VALUES ('R00012', 'M00012', 'M00018', '너무 친절하셔서 기분 좋았습니다.','2023/05/02');
INSERT INTO report VALUES ('R00013', 'M00013', 'M00010', '유쾌하실 것 같습니다.', '2023/05/03');
INSERT INTO report VALUES ('R00014', 'M00014', 'M00004', '좋은 인상을 받았습니다.', '2023/05/04');
INSERT INTO report VALUES ('R00015', 'M00015', 'M00006', '매너가 좋아서 기분이 좋았습니다.', '2023/05/05');
INSERT INTO report VALUES ('R00016', 'M00016', 'M00020', '착하실 것 같은 회원입니다.', '2023/05/06');
INSERT INTO report VALUES ('R00017', 'M00017', 'M00012', '친절하실 것 같아요.','2023-02-01');

INSERT INTO report VALUES ('R00018', 'M00018', 'M00013', '인상이 너무 좋아 보이십니다.', '2023-03-15');

INSERT INTO report VALUES ('R00019', 'M00019', 'M00014', '자신감이 넘쳐 보이십니다.', '2023-05-12');

INSERT INTO report VALUES ('R00020', 'M00020', 'M00015', '좋은 인상을 받았습니다.', '2023-04-20');










INSERT INTO report_fks VALUES ('R00001', 'admin1');

INSERT INTO report_fks VALUES ('R00002', 'admin2');

INSERT INTO report_fks VALUES ('R00003', 'admin3');

INSERT INTO report_fks VALUES ('R00004', 'admin4');

INSERT INTO report_fks VALUES ('R00005', 'admin5');

INSERT INTO report_fks VALUES ('R00006', 'admin6');

INSERT INTO report_fks VALUES ('R00007', 'admin7');

INSERT INTO report_fks VALUES ('R00008', 'admin8');

INSERT INTO report_fks VALUES ('R00009', 'admin9');

INSERT INTO report_fks VALUES ('R00010', 'admin10');

INSERT INTO report_fks VALUES ('R00011', 'admin11');

INSERT INTO report_fks VALUES ('R00012', 'admin12');

INSERT INTO report_fks VALUES ('R00013', 'admin13');

INSERT INTO report_fks VALUES ('R00014', 'admin14');

INSERT INTO report_fks VALUES ('R00015', 'admin15');

INSERT INTO report_fks VALUES ('R00016', 'admin16');

INSERT INTO report_fks VALUES ('R00017', 'admin17');

INSERT INTO report_fks VALUES ('R00018', 'admin18');

INSERT INTO report_fks VALUES ('R00019', 'admin19');

INSERT INTO report_fks VALUES ('R00020', 'admin20');


INSERT INTO chat_fks VALUES ('member001', 'chat1');
INSERT INTO chat_fks VALUES ('member002', 'chat2');
INSERT INTO chat_fks VALUES ('member003', 'chat1');
INSERT INTO chat_fks VALUES ('member004', 'chat3');
INSERT INTO chat_fks VALUES ('member005', 'chat2');
INSERT INTO chat_fks VALUES ('member006', 'chat4');
INSERT INTO chat_fks VALUES ('member007', 'chat3');
INSERT INTO chat_fks VALUES ('member008', 'chat5');
INSERT INTO chat_fks VALUES ('member009', 'chat4');




INSERT INTO game_fks VALUES ('G00001', 'GR00001');




INSERT INTO Matching_fks VALUES ('member001', 'MT00001');
INSERT INTO Matching_fks VALUES ('member002', 'MT00002');
INSERT INTO Matching_fks VALUES ('member003', 'MT00003');
INSERT INTO Matching_fks VALUES ('member004', 'MT00004');
INSERT INTO Matching_fks VALUES ('member005', 'MT00005');
INSERT INTO Matching_fks VALUES ('member006', 'MT00006');
INSERT INTO Matching_fks VALUES ('member007', 'MT00007');
INSERT INTO Matching_fks VALUES ('member008', 'MT00008');
INSERT INTO Matching_fks VALUES ('member009', 'MT00009');

commit;
