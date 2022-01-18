select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,customer c
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 7 and ss.ss_hash <= 757 and cd.cd_hash >= 651 and cd.cd_hash <= 984 and c.c_hash >= 258 and c.c_hash <= 658
;
