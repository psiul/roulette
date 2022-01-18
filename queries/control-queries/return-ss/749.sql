select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 146 and i.i_hash <= 546 and cd.cd_hash >= 155 and cd.cd_hash <= 905 and c.c_hash >= 428 and c.c_hash <= 761
;
