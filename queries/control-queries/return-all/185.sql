select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer c,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 166 and ss.ss_hash <= 916 and hd.hd_hash >= 608 and hd.hd_hash <= 941 and d.d_hash >= 176 and d.d_hash <= 576
;
