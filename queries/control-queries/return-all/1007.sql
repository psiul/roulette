select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,customer c,item i,store_returns sr
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and cd.cd_hash >= 73 and cd.cd_hash <= 406 and c.c_hash >= 238 and c.c_hash <= 988 and i.i_hash >= 590 and i.i_hash <= 990
;
