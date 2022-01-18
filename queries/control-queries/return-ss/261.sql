select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,customer c,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 16 and ss.ss_hash <= 416 and cd.cd_hash >= 157 and cd.cd_hash <= 490 and i.i_hash >= 98 and i.i_hash <= 848
;
