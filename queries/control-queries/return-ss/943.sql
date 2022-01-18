select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,customer c,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 428 and i.i_hash <= 761 and cd.cd_hash >= 148 and cd.cd_hash <= 898 and c.c_hash >= 241 and c.c_hash <= 641
;
