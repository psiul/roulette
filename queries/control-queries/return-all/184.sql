select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,date_dim d
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and hd.hd_hash >= 262 and hd.hd_hash <= 662 and i.i_hash >= 41 and i.i_hash <= 791 and d.d_hash >= 492 and d.d_hash <= 825
;
