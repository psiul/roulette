select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 568 and ss.ss_hash <= 768 and i.i_hash >= 253 and i.i_hash <= 753
;
