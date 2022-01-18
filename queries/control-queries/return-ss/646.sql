select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 60 and hd.hd_hash <= 810 and c.c_hash >= 234 and c.c_hash <= 567 and d.d_hash >= 471 and d.d_hash <= 871
;
