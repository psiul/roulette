select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 414 and ss.ss_hash <= 814 and hd.hd_hash >= 232 and hd.hd_hash <= 982 and i.i_hash >= 317 and i.i_hash <= 650
;
