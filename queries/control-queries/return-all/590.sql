select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,customer c,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 322 and cd.cd_hash <= 655 and i.i_hash >= 145 and i.i_hash <= 895 and c.c_hash >= 411 and c.c_hash <= 811
;
