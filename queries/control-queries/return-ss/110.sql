select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,customer_demographics cd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 247 and ss.ss_hash <= 997 and c.c_hash >= 58 and c.c_hash <= 458 and cd.cd_hash >= 151 and cd.cd_hash <= 484
;
