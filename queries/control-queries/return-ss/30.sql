select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,date_dim d,customer_demographics cd
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 78 and ss.ss_hash <= 828 and c.c_hash >= 491 and c.c_hash <= 824 and cd.cd_hash >= 351 and cd.cd_hash <= 751
;
