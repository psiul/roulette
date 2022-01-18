select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 105 and ss.ss_hash <= 505 and cd.cd_hash >= 440 and cd.cd_hash <= 773 and c.c_hash >= 107 and c.c_hash <= 857
;
