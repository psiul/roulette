select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 398 and ss.ss_hash <= 898 and i.i_hash >= 771 and i.i_hash <= 971
;
