select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,household_demographics hd,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and i.i_hash >= 111 and i.i_hash <= 444 and hd.hd_hash >= 50 and hd.hd_hash <= 450 and d.d_hash >= 4 and d.d_hash <= 754
;
