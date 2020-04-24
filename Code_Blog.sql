-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 24, 2020 at 12:51 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Code_Blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `_id` int(10) NOT NULL,
  `name` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`_id`, `name`, `email`, `phone_num`, `message`, `created_at`, `updated_at`, `status`) VALUES
(1, 'Sourabh', 'sourabh124421@gmail.com', '9716233997', 'This is a new message that confirms the working of codeBlog flask app. ', '2020-04-18 17:38:26', '2020-04-18 17:38:26', '1'),
(2, 'ss', 'ss', '22', 's2', '2020-04-18 17:58:32', '2020-04-18 17:58:32', '1'),
(3, 'Sourabh D Sunshine', 'sourabh124421@gmail.com', '9716233997', 'This is message after adding dismissable flash message in flask app', '2020-04-24 16:19:54', '2020-04-24 16:19:54', '1');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `_id` int(10) NOT NULL,
  `title` varchar(200) NOT NULL,
  `sub_heading` varchar(200) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `img_file` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`_id`, `title`, `sub_heading`, `slug`, `img_file`, `content`, `author`, `created_at`, `updated_at`, `status`) VALUES
(1, 'First Post-after ID', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-24 14:57:38', '1'),
(33, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(37, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(38, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(39, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(40, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(41, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(42, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(43, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(44, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(45, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(46, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(47, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(48, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(49, 'First Post', 'sub-heading from DB', 'first-post', 'post-bg.jpg', 'There are many reasons to start a blog for personal use and only a handful of strong ones for business blogging. Blogging for business, projects, or anything else that might bring you money has a very straightforward purpose – to rank your website higher in Google SERPs, a.k.a. increase your visibility.\r\n\r\nAs a business, you rely on consumers to keep buying your products and services. As a new business, you rely on blogging to help you get to these consumers and grab their attention. Without blogging, your website would remain invisible, whereas running a blog makes you searchable and competitive.\r\n\r\nSo, the main purpose of a blog is to connect you to the relevant audience. Another one is to boost your traffic and send quality leads to your website.\r\n\r\nThe more frequent and better your blog posts are, the higher the chances for your website to get discovered and visited by your target audience. Which means, a blog is an effective lead generation tool. Add a great call to action (CTA), and it will convert your website traffic into high-quality leads. But a blog also allows you to showcase your authority and build a brand.\r\n\r\nWhen you use your niche knowledge for creating informative and engaging posts, it builds trust with your audience. Great blogging makes your business looks more credible, which is especially important if your brand is still young and fairly unknown. It ensures presence and authority at the same time.', 'Sourabh D Sunshine', '2020-04-18 17:48:15', '2020-04-23 23:32:21', '1'),
(50, 'Added via Admin Panel33', 'tag-line33', 'adm-pan33', 'admin.jpg', 'kkkk', 'Sourabh Kumar', '2020-04-23 23:59:10', '2020-04-24 00:12:41', '1'),
(51, 'new POst', 'a', 'a', 'aa', 'aaaaa', 'Sourabh', '2020-04-24 14:58:01', '2020-04-24 14:58:01', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
