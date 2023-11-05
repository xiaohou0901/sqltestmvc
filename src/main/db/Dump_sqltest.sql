-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: sqltest
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `c_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `t_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('01','语文','02'),('02','数学','01'),('03','英语','03');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `oid` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint DEFAULT NULL,
  `qid` bigint DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  PRIMARY KEY (`oid`),
  UNIQUE KEY `oid_UNIQUE` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,7,1,10),(2,7,1,100),(3,7,3,100),(4,7,3,100),(5,8,3,100),(6,7,22,100),(7,7,22,100),(8,1,1,1),(9,7,1,100),(10,7,1,100),(11,12,1,100);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` varchar(20) DEFAULT NULL,
  `question` text,
  `answer` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES ('1','查询\"01\"课程比\"02\"课程成绩高的学生的信息及课程分数','select st.*,sc.s_score as \'语文\' ,sc2.s_score \'数学\'\nfrom student st\nleft join score sc on sc.s_id=st.s_id and sc.c_id=\'01\'\nleft join score sc2 on sc2.s_id=st.s_id and sc2.c_id=\'02\'\nwhere sc.s_score>sc2.s_score'),('2','查询\"01\"课程比\"02\"课程成绩低的学生的信息及课程分数','select st.*,sc.s_score \'语文\',sc2.s_score \'数学\' from student st\nleft join score sc on sc.s_id=st.s_id and sc.c_id=\'01\'\nleft join score sc2 on sc2.s_id=st.s_id and sc2.c_id=\'02\'\nwhere sc.s_score<sc2.s_score'),('3','查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩','select st.s_id,st.s_name,ROUND(AVG(sc.s_score),2) cjScore from student st\nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id having AVG(sc.s_score)>=60'),('4','查询平均成绩小于60分的同学的学生编号和学生姓名和平均成绩 (包括有成绩的和无成绩的)','select st.s_id,st.s_name,(case when ROUND(AVG(sc.s_score),2) is null then 0 else ROUND(AVG(sc.s_score)) end ) cjScore from student st\nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id having AVG(sc.s_score)<60 or AVG(sc.s_score) is NULL'),('5','查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩','select st.s_id,st.s_name,count(c.c_id),( case when SUM(sc.s_score) is null or sum(sc.s_score)=\"\" then 0 else SUM(sc.s_score) end) from student st\nleft join score sc on sc.s_id =st.s_id \nleft join course c on c.c_id=sc.c_id\ngroup by st.s_id'),('6','查询\"李\"姓老师的数量','select t.t_name,count(t.t_id) from teacher t\ngroup by t.t_id having t.t_name like \"李%\"; '),('7','查询学过\"张三\"老师授课的同学的信息','select st.* from student st \nleft join score sc on sc.s_id=st.s_id\nleft join course c on c.c_id=sc.c_id\nleft join teacher t on t.t_id=c.t_id\n where t.t_name=\"张三\"'),('8','查询没学过\"张三\"老师授课的同学的信息',' select c.* from course c left join teacher t on t.t_id=c.t_id where t.t_name=\"张三\"\n select sc.s_id from score sc where sc.c_id in (select c.c_id from course c left join teacher t on t.t_id=c.t_id where t.t_name=\"张三\")\n select st.* from student st where st.s_id not in(\n select sc.s_id from score sc where sc.c_id in (select c.c_id from course c left join teacher t on t.t_id=c.t_id where t.t_name=\"张三\")\n )'),('9','查询学过编号为\"01\"并且也学过编号为\"02\"的课程的同学的信息','select st.* from student st \ninner join score sc on sc.s_id = st.s_id\ninner join course c on c.c_id=sc.c_id and c.c_id=\"01\"\nwhere st.s_id in (\nselect st2.s_id from student st2 \ninner join score sc2 on sc2.s_id = st2.s_id\ninner join course c2 on c2.c_id=sc2.c_id and c2.c_id=\"02\"\n)'),('10','查询学过编号为\"01\"但是没有学过编号为\"02\"的课程的同学的信息','select st.* from student st \ninner join score sc on sc.s_id = st.s_id\ninner join course c on c.c_id=sc.c_id and c.c_id=\"01\"\nwhere st.s_id not in (\nselect st2.s_id from student st2 \ninner join score sc2 on sc2.s_id = st2.s_id\ninner join course c2 on c2.c_id=sc2.c_id and c2.c_id=\"02\"\n)'),('11','查询没有学全所有课程的同学的信息','select st.* from Student st\nleft join Score S\non st.s_id = S.s_id\ngroup by st.s_id\nhaving count(c_id)<(select count(c_id) from Course)\n '),('12','查询至少有一门课与学号为\"01\"的同学所学相同的同学的信息','select distinct st.* from student st \nleft join score sc on sc.s_id=st.s_id\nwhere sc.c_id in (\nselect sc2.c_id from student st2\nleft join score sc2 on sc2.s_id=st2.s_id\nwhere st2.s_id =\'01\'\n)'),('13','查询和\"01\"号的同学学习的课程完全相同的其他同学的信息','mselect st.* from student st \nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id\nhaving group_concat(sc.c_id) = \n(\nselect group_concat(sc2.c_id) from student st2\nleft join score sc2 on sc2.s_id=st2.s_id\nwhere st2.s_id =\'01\'\n)\n '),('14','查询没学过\"张三\"老师讲授的任一门课程的学生姓名','select st.s_name from student st \nwhere st.s_id not in (\nselect sc.s_id from score sc \ninner join course c on c.c_id=sc.c_id\ninner join teacher t on t.t_id=c.t_id and t.t_name=\"张三\"\n)'),('15','查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩','select st.s_id,st.s_name,avg(sc.s_score) from student st\nleft join score sc on sc.s_id=st.s_id\nwhere sc.s_id in (\nselect sc.s_id from score sc \nwhere sc.s_score<60 or sc.s_score is NULL\ngroup by sc.s_id having COUNT(sc.s_id)>=2\n)\ngroup by st.s_id'),('16','检索\"01\"课程分数小于60，按分数降序排列的学生信息','select st.*,sc.s_score from student st \ninner join score sc on sc.s_id=st.s_id and sc.c_id=\"01\" and sc.s_score<60\norder by sc.s_score desc'),('17','按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩','select st.s_id,st.s_name,avg(sc4.s_score) \"平均分\",sc.s_score \"语文\",sc2.s_score \"数学\",sc3.s_score \"英语\" from student st\nleft join score sc on sc.s_id=st.s_id and sc.c_id=\"01\"\nleft join score sc2 on sc2.s_id=st.s_id and sc2.c_id=\"02\"\nleft join score sc3 on sc3.s_id=st.s_id and sc3.c_id=\"03\"\nleft join score sc4 on sc4.s_id=st.s_id\ngroup by st.s_id \norder by SUM(sc4.s_score) desc'),('18','查询各科成绩最高分、最低分和平均分：以如下形式显示：课程ID，课程name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率。及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90','select c.c_id,c.c_name,max(sc.s_score) \"最高分\",MIN(sc2.s_score) \"最低分\",avg(sc3.s_score) \"平均分\"\n,((select count(s_id) from score where s_score>=60 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) \"及格率\"\n,((select count(s_id) from score where s_score>=70 and s_score<80 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) \"中等率\"\n,((select count(s_id) from score where s_score>=80 and s_score<90 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) \"优良率\"\n,((select count(s_id) from score where s_score>=90 and c_id=c.c_id )/(select count(s_id) from score where c_id=c.c_id)) \"优秀率\"\nfrom course c\nleft join score sc on sc.c_id=c.c_id \nleft join score sc2 on sc2.c_id=c.c_id \nleft join score sc3 on sc3.c_id=c.c_id \ngroup by c.c_id'),('19','按各科成绩进行排序，并显示排名','select c1.s_id,c1.c_id,c1.c_name,@score:=c1.s_score,@i:=@i+1 from (select c.c_name,sc.* from course c \nleft join score sc on sc.c_id=c.c_id\nwhere c.c_id=\"01\" order by sc.s_score desc) c1 ,\n(select @i:=0) a\nunion all\nselect c2.s_id,c2.c_id,c2.c_name,c2.s_score,@ii:=@ii+1 from (select c.c_name,sc.* from course c \nleft join score sc on sc.c_id=c.c_id\nwhere c.c_id=\"02\" order by sc.s_score desc) c2 ,\n(select @ii:=0) aa \nunion all\nselect c3.s_id,c3.c_id,c3.c_name,c3.s_score,@iii:=@iii+1 from (select c.c_name,sc.* from course c \nleft join score sc on sc.c_id=c.c_id\nwhere c.c_id=\"03\" order by sc.s_score desc) c3;\nset @iii=0;'),('20','查询学生的总成绩并进行排名','select st.s_id,st.s_name\n,(case when sum(sc.s_score) is null then 0 else sum(sc.s_score) end)\n from student st\nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id order by sum(sc.s_score) desc'),('21','查询不同老师所教不同课程平均分从高到低显示','select t.t_id,t.t_name,c.c_name,avg(sc.s_score) from teacher t \nleft join course c on c.t_id=t.t_id \nleft join score sc on sc.c_id =c.c_id\ngroup by t.t_id\norder by avg(sc.s_score) desc'),('22','查询所有课程的成绩第2名到第3名的学生信息及该课程成绩','select a.* from (\nselect st.*,c.c_id,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id =sc.c_id and c.c_id=\"01\"\norder by sc.s_score desc LIMIT 1,2 ) a\nunion all\nselect b.* from (\nselect st.*,c.c_id,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id =sc.c_id and c.c_id=\"02\"\norder by sc.s_score desc LIMIT 1,2) b\nunion all\nselect c.* from (\nselect st.*,c.c_id,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id =sc.c_id and c.c_id=\"03\"\norder by sc.s_score desc LIMIT 1,2) c'),('23','统计各科成绩各分数段人数：课程编号,课程名称,[100-85],[85-70],[70-60],[0-60]及所占百分比','select c.c_id,c.c_name \n,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=100 and sc.s_score>80)/(select count(1) from score sc where sc.c_id=c.c_id )) \"100-85\"\n,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=85 and sc.s_score>70)/(select count(1) from score sc where sc.c_id=c.c_id )) \"85-70\"\n,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=70 and sc.s_score>60)/(select count(1) from score sc where sc.c_id=c.c_id )) \"70-60\"\n,((select count(1) from score sc where sc.c_id=c.c_id and sc.s_score<=60 and sc.s_score>=0)/(select count(1) from score sc where sc.c_id=c.c_id )) \"60-0\"\nfrom course c order by c.c_id'),('24','查询学生平均成绩及其名次','set @i=0;\nselect a.*,@i:=@i+1 from (\nselect st.s_id,st.s_name,round((case when avg(sc.s_score) is null then 0 else avg(sc.s_score) end),2) \"平均分\" from student st\nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id order by sc.s_score desc) a'),('25','查询各科成绩前三名的记录','select a.* from (\n select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st\n left join score sc on sc.s_id=st.s_id\n inner join course c on c.c_id=sc.c_id and c.c_id=\'01\'\n order by sc.s_score desc LIMIT 0,3) a\nunion all\nselect b.* from (\n select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st\n left join score sc on sc.s_id=st.s_id\n inner join course c on c.c_id=sc.c_id and c.c_id=\'02\'\n order by sc.s_score desc LIMIT 0,3) b\nunion all\nselect c.* from (\n select st.s_id,st.s_name,c.c_id,c.c_name,sc.s_score from student st\n left join score sc on sc.s_id=st.s_id\n inner join course c on c.c_id=sc.c_id and c.c_id=\'03\'\n order by sc.s_score desc LIMIT 0,3) c'),('26','查询每门课程被选修的学生数','select c.c_id,c.c_name,count(1) from course c \nleft join score sc on sc.c_id=c.c_id\ninner join student st on st.s_id=c.c_id\ngroup by st.s_id'),('27','查询出只有两门课程的全部学生的学号和姓名','select st.s_id,st.s_name from student st \nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id=sc.c_id \ngroup by st.s_id having count(1)=2'),('28','查询男生、女生人数','select st.s_sex,count(1) from student st group by st.s_sex'),('29','查询名字中含有\"风\"字的学生信息','select st.* from student st where st.s_name like \"%风%\";'),('30','查询同名同性学生名单，并统计同名人数','select st.*,count(1) from student st group by st.s_name,st.s_sex having count(1)>1'),('31','查询1990年出生的学生名单','select st.* from student st where st.s_birth like \"1990%\";'),('32','查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列','select c.c_id,c.c_name,avg(sc.s_score) from course c\ninner join score sc on sc.c_id=c.c_id \ngroup by c.c_id order by avg(sc.s_score) desc,c.c_id asc'),('33','查询平均成绩大于等于85的所有学生的学号、姓名和平均成绩','select st.s_id,st.s_name,avg(sc.s_score) from student st\nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id having avg(sc.s_score)>=85'),('34','查询课程名称为\"数学\"，且分数低于60的学生姓名和分数','select st.s_id,st.s_name,sc.s_score from student st\ninner join score sc on sc.s_id=st.s_id and sc.s_score<60\ninner join course c on c.c_id=sc.c_id and c.c_name =\"数学\"'),('35','查询所有学生的课程及分数情况；','select st.s_id,st.s_name,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\nleft join course c on c.c_id =sc.c_id\norder by st.s_id,c.c_name'),('36','查询任何一门课程成绩在70分以上的姓名、课程名称和分数','select st2.s_id,st2.s_name,c2.c_name,sc2.s_score from student st2\nleft join score sc2 on sc2.s_id=st2.s_id\nleft join course c2 on c2.c_id=sc2.c_id \nwhere st2.s_id in(\nselect st.s_id from student st \nleft join score sc on sc.s_id=st.s_id \ngroup by st.s_id having min(sc.s_score)>=70)\norder by s_id'),('37','查询不及格的课程','select st.s_id,c.c_name,st.s_name,sc.s_score from student st\ninner join score sc on sc.s_id=st.s_id and sc.s_score<60\ninner join course c on c.c_id=sc.c_id '),('38','查询课程编号为01且课程成绩在80分以上的学生的学号和姓名','select st.s_id,st.s_name,sc.s_score from student st\ninner join score sc on sc.s_id=st.s_id and sc.c_id=\"01\" and sc.s_score>=80'),('39','求每门课程的学生人数','select c.c_id,c.c_name,count(1) from course c\ninner join score sc on sc.c_id=c.c_id\ngroup by c.c_id'),('40','查询选修\"张三\"老师所授课程的学生中，成绩最高的学生信息及其成绩','select st.*,c.c_name,sc.s_score,t.t_name from student st\ninner join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id=sc.c_id \ninner join teacher t on t.t_id=c.t_id and t.t_name=\"张三\"\norder by sc.s_score desc\nlimit 0,1'),('41','查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩','select st.s_id,st.s_name,sc.c_id,sc.s_score from student st \nleft join score sc on sc.s_id=st.s_id\nleft join course c on c.c_id=sc.c_id\nwhere (\nselect count(1) from student st2 \nleft join score sc2 on sc2.s_id=st2.s_id\nleft join course c2 on c2.c_id=sc2.c_id\nwhere sc.s_score=sc2.s_score and c.c_id!=c2.c_id \n)>1'),('42','查询每门功成绩最好的前两名','select a.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id=sc.c_id and c.c_id=\"01\"\norder by sc.s_score desc limit 0,2) a\nunion all\nselect b.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id=sc.c_id and c.c_id=\"02\"\norder by sc.s_score desc limit 0,2) b\nunion all\nselect c.* from (select st.s_id,st.s_name,c.c_name,sc.s_score from student st\nleft join score sc on sc.s_id=st.s_id\ninner join course c on c.c_id=sc.c_id and c.c_id=\"03\"\norder by sc.s_score desc limit 0,2) c'),('43','统计每门课程的学生选修人数（超过5人的课程才统计）。要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列','select sc.c_id,count(1) from score sc\nleft join course c on c.c_id=sc.c_id\ngroup by c.c_id having count(1)>5\norder by count(1) desc,sc.c_id asc'),('44','检索至少选修两门课程的学生学号','select st.s_id from student st \nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id having count(1)>=2'),('45','查询选修了全部课程的学生信息','select st.* from student st \nleft join score sc on sc.s_id=st.s_id\ngroup by st.s_id having count(1)=(select count(1) from course)'),('46','查询各学生的年龄','select st.*,timestampdiff(year,st.s_birth,now()) from student st'),('47','查询本周过生日的学生','select st.* from student st \nwhere week(now())+1=week(date_format(st.s_birth,\'%Y%m%d\'))'),('48','查询本月过生日的学生','select st.* from student st \nwhere month(now())=month(date_format(st.s_birth,\'%Y%m%d\'))'),('49','查询下月过生日的学生','select st.* from student st \nwhere month(timestampadd(month,1,now()))=month(date_format(st.s_birth,\'%Y%m%d\'))');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score`
--

DROP TABLE IF EXISTS `score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score` (
  `s_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_score` int DEFAULT NULL,
  PRIMARY KEY (`s_id`,`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='成绩表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score`
--

LOCK TABLES `score` WRITE;
/*!40000 ALTER TABLE `score` DISABLE KEYS */;
INSERT INTO `score` VALUES ('01','01',80),('01','02',90),('01','03',99),('02','01',70),('02','02',60),('02','03',80),('03','01',80),('03','02',80),('03','03',80),('04','01',50),('04','02',30),('04','03',20),('05','01',76),('05','02',87),('06','01',31),('06','03',34),('07','02',89),('07','03',98);
/*!40000 ALTER TABLE `score` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `s_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `s_birth` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `s_sex` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('01','赵雷','1990-01-01','男'),('02','钱电','1990-12-21','男'),('03','孙风','1990-05-20','男'),('04','李云','1990-08-06','男'),('05','周梅','1991-12-01','女'),('06','吴兰','1992-03-01','女'),('07','郑竹','1989-07-01','女'),('08','王菊','1990-01-20','女');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `t_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `t_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='教师表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('01','张三'),('02','李四'),('03','王五');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `num` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'侯智豪','230953012','230953012','0'),(2,'侯老师','13598953905','13598953905','1'),(3,'梁玉栋','230953005','230953005','0'),(4,'高林','230953013','230953013','0'),(5,'胡金宇','230953007','230953007','0'),(6,'黄仕豪','230953009','230953009','0'),(7,'侯智豪1','001','001','0'),(8,'侯智豪02','002','002','0'),(9,'侯智豪03','003','003','0'),(10,'Jack','004','004','1'),(11,'老师1','006','006','1'),(12,'学生1','007','007','0');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-05 21:23:01
