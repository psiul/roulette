select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,customer c,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 605 and ss.ss_hash <= 938 and c.c_hash >= 63 and c.c_hash <= 813 and hd.hd_hash >= 246 and hd.hd_hash <= 646
;
