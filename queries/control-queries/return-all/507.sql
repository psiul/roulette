select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 355 and ss.ss_hash <= 688 and c.c_hash >= 460 and c.c_hash <= 860 and cd.cd_hash >= 59 and cd.cd_hash <= 809
;
