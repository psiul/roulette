select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 46 and ss.ss_hash <= 446 and c.c_hash >= 41 and c.c_hash <= 791 and cd.cd_hash >= 642 and cd.cd_hash <= 975
;
