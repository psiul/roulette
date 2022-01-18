select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,customer_demographics cd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and c.c_hash >= 604 and c.c_hash <= 937 and i.i_hash >= 184 and i.i_hash <= 584 and cd.cd_hash >= 2 and cd.cd_hash <= 752
;
