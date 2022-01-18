select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,customer_demographics cd,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_current_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and c.c_hash >= 28 and c.c_hash <= 428 and cd.cd_hash >= 5 and cd.cd_hash <= 338 and i.i_hash >= 242 and i.i_hash <= 992
;
