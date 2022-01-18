select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,customer_demographics cd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and c.c_current_cdemo_sk = cd.cd_demo_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 194 and ss.ss_hash <= 527 and c.c_hash >= 45 and c.c_hash <= 795 and d.d_hash >= 233 and d.d_hash <= 633
;
