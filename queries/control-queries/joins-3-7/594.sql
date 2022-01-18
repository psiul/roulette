select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 216 and ss.ss_hash <= 966 and hd.hd_hash >= 501 and hd.hd_hash <= 901 and i.i_hash >= 250 and i.i_hash <= 583
;
