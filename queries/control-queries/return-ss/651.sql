select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,household_demographics hd,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 108 and ss.ss_hash <= 858 and c.c_hash >= 91 and c.c_hash <= 491 and hd.hd_hash >= 145 and hd.hd_hash <= 478
;
