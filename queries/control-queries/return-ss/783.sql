select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 642 and ss.ss_hash <= 975 and d.d_hash >= 82 and d.d_hash <= 482 and c.c_hash >= 134 and c.c_hash <= 884
;
