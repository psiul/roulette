select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 194 and ss.ss_hash <= 944 and cd.cd_hash >= 328 and cd.cd_hash <= 661 and c.c_hash >= 174 and c.c_hash <= 574
;
