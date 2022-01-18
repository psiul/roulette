select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 103 and ss.ss_hash <= 503 and i.i_hash >= 161 and i.i_hash <= 911 and cd.cd_hash >= 465 and cd.cd_hash <= 798
;
