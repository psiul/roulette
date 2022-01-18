select count(ss.ss_item_sk)
from store_sales ss,date_dim d,household_demographics hd,customer c,store_returns sr
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and d.d_hash >= 320 and d.d_hash <= 720 and hd.hd_hash >= 642 and hd.hd_hash <= 975 and c.c_hash >= 82 and c.c_hash <= 832
;
